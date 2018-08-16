# project/models.py

from main import db


class User(db.Model):

    __tablename__ = 'user'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(16), unique=True, nullable=False)
    phone = db.Column(db.String(32), unique=True, nullable=False)
    email = db.Column(db.String(32), unique=True, nullable=False)
    skype = db.Column(db.String(32), unique=True, nullable=False)
    address = db.Column(db.String(64), unique=True, nullable=False)

    def __init__(self, name, phone, email, skype, address):
        self.name = name
        self.phone = phone
        self.email = email
        self.skype = skype
        self.address = address


class Knowledge(db.Model):

    __tablename__ = "knowledge"

    knowledge_id = db.Column(db.Integer, primary_key=True)
    knowledge = db.Column(db.String(1000), nullable=False)

    def __init__(self, knowledge):
        self.knowledge = knowledge


class Expirience(db.Model):

    __tablename__ = "expirience"

    expirience_id = db.Column(db.Integer, primary_key=True)
    position = db.Column(db.String(100), nullable=False)
    time = db.Column(db.String(32), nullable=False)
    site = db.Column(db.String(64), nullable=False)
    expirience = db.Column(db.String(1000), nullable=False)

    def __init__(self, position, time, site, expirience):
        self.position = position
        self.time = time
        self.site = site
        self.expirience = expirience
