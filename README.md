this is my little sinatra template
==================================

what does it do?

development mode automatically reloads models and lib directory
---------------------------------------------------------------

by default, you are in development mode. any stuff you put in your ``models``
or ``lib`` directory gets reloaded with every request. Your RACK_ENV determines
what database you use, as well.

active record migrations
------------------------

throw your active record migrations into the ``db/migrate`` directory, and run
``rake db:migate``. your migrations will run.

application console
-------------------

just like rails, you can drop into an irb shell which has your environment loaded
up into it and interact with your application that way. you can run ``rake irb`` or
``rake console``.

cucumber!
---------

throw your cucumber features into the ``features`` directory. you can run
``rake cucumber``, which is just a shortcut to ``cucumber features``.

bundler
-------

put the gems you want to use into your ``Gemfile`` and run ``bundle install``.
this will automatically include the gems in your application.

team fun helpers
----------------

the team fun helpers add url magic to your models.
if you use rails-like routing, (``/<class>/<id>``), you can use ``redirect_to @model``.

if you don't, just define the ``to_uri`` method for your models, like so:

    def to_uri
      "/projects/#{name}"
    end

and ``redirect\_to`` will work. You can also use ``link_to`` in the same way in your
templates.

team fun form builder
---------------------

you get a rails style ``form_for @object`` method. it detects the correct HTTP method
and uri based on the same criteria of link_to.

configuration hash
------------------

add a yaml file to your ``config`` directory and it will be automatically parsed and
available to you in the Environment::Config object. if your file is called ``database.yml``,
for instance, you can access that hash via ``Environment::Config.database``

Heroku compatible!
------------------

the default database configuration system is completely compatible with Heroku

how to install
==============

clone the repository, ``gem install bundler``, ``bundle install``.