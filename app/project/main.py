from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.config.from_pyfile('_config.py')
db = SQLAlchemy(app)

from models import User, Knowledge, Expirience


def list_personal_info():
    return db.session.query(User)


def list_knowledge():
    return db.session.query(Knowledge)


def list_expirience():
    return db.session.query(Expirience)


@app.route("/", methods=['GET'])
def main():
    return render_template(
        'main.html',
        personal_info=list_personal_info(),
        knowledge=list_knowledge(),
        expirience=list_expirience()
    )
