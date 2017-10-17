"""Musilitar API - Database initialization"""
import dataset


database = dataset.connect("sqlite:///MusilitarAPI.db")


def initialize_database():
    insert_api_keys()


def insert_api_keys():
    table = database["api_keys"]

    table.insert
    (
        {
            "api_key": "be37fd3a-a070-4e44-815e-f430e1e5dfd2", 
            "email": "musilitar@gmail.com"
        }
    )
    table.insert
    (
        {
            "api_key": "6f5dfb13-c9ec-47a9-8417-129506410658", 
            "email": "musilitar@gmail.com"
        }
    )
    table.insert
    (
        {
            "api_key": "72181684-ec16-4087-8728-71ae29388284", 
            "email": "musilitar@gmail.com"
        }
    )
    table.insert
    (
        {
            "api_key": "11139b8f-eefa-467e-9a31-a71ccface5a2", 
            "email": "musilitar@gmail.com"
        }
    )
    table.insert
    (
        {
            "api_key": "acddca2e-e09e-4680-a2c6-19d5fdd53803", 
            "email": "musilitar@gmail.com"
        }
    )
    table.insert
    (
        {
            "api_key": "2e62f2b0-7f00-495c-b295-75a67aef6d10", 
            "email": "musilitar@gmail.com"
        }
    )
    table.insert
    (
        {
            "api_key": "0464c9d4-cafe-49c8-a443-698b1142df6c", 
            "email": "musilitar@gmail.com"
        }
    )
    table.insert
    (
        {
            "api_key": "cec25532-c915-4b0b-a668-0e50367ff7d6", 
            "email": "musilitar@gmail.com"
        }
    )
    table.insert
    (
        {
            "api_key": "2b1060ec-c1f1-4332-b8bf-726f715e9391", 
            "email": "musilitar@gmail.com"
        }
    )
    table.insert
    (
        {
            "api_key": "030a8a20-dc39-40ab-8f66-0354b7e6c1fe", 
            "email": "musilitar@gmail.com"
        }
    )
