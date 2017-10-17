"""MusilitarAPI - Authentication module"""
from datetime import datetime, timezone, timedelta

import hug
import dataset

from jose import jwt

from config import SECRET_KEY


database = dataset.connect("sqlite:///MusilitarAPI.db")


@hug.cli()
def authenticate_api_key(api_key):
    """
    Authenticate an API key against our database
    :param api_key:
    :return: string
    """

    result = database["api_key"].find_one(api_key=api_key)

    if result is not None:
        return result["email"]
    else:
        return None


@hug.cli()
def encode_authorization_token(subject):
    """
    Encode the payload
    :param subject:
    :return: string
    """

    payload =
    {
        "iat": datetime.now(timezone.utc),
        "exp": datetime.now(timezone.utc) + timedelta(hours=1),
        "sub": subject
    }
    token = jwt.encode
    (
        payload,
        SECRET_KEY,
        algorithm="HS256"
    )

    return token


@hug.cli()
def decode_authorization_token(authorization_token):
    """
    Decodes the authorization token
    :param authorization_token:
    :return: integer|string
    """

    payload = jwt.decode
    (
        authorization_token,
        SECRET_KEY,
        algorithms="HS256"
    )

    return payload


api_key_authentication = hug.authentication.api_key(authenticate_api_key)
