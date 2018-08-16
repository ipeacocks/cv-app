import os


SQLALCHEMY_TRACK_MODIFICATIONS = False

WTF_CSRF_ENABLED = True
SECRET_KEY = 's3cr3t'
DEBUG = True


# ---- SQLite ----
# grab the folder where this script lives
# basedir = os.path.abspath(os.path.dirname(__file__))

# define the full path for the database
# DATABASE = 'cv.db'
# DATABASE_PATH = os.path.join(basedir, DATABASE)
#
# the database uri
# SQLALCHEMY_DATABASE_URI = 'sqlite:///' + DATABASE_PATH
# --------

# ---- MySQL ----
# FIXME: move password to env vars or whatever
USER = 'my_cv_user'
PASSWORD = 'my-secret-pw'
HOST = 'cv-mariadb.my-zone'
# HOST = '127.0.0.1'
DATABASE = 'my_cv_db'

SQLALCHEMY_DATABASE_URI = 'mysql://{}:{}@{}/{}'.format(USER, PASSWORD,
                                                       HOST, DATABASE)
# --------
