from datetime import datetime, timezone, timedelta
from falcon import HTTP_200, HTTP_400

import hug
import dataset

from jose import jwt

from config import SECRET_KEY


database = dataset.connect("sqlite:///MusilitarAPI.db")


@hug.call("/authenticate", ["POST"], versions=1)
def authenticate(body, response):
    api_key = body["api_key"]
    if api_key:
        subject = authenticate_api_key(api_key)
        if subject:
            set_authorization_token(subject, response)
            response.status = HTTP_200
            return
    response.status = HTTP_400


def verify_authorization_token(request, response, module):
    token = request.get_header("Authorization")
    if token:
        refresh_authorization_token(request, response)
    return False


def authenticate_api_key(api_key):
    result = database["api_keys"].find_one(api_key=api_key)

    if result:
        return result["email"]
    else:
        return None


def encode_authorization_token(subject):
    payload = {
        "iat": datetime.now(timezone.utc),
        "exp": datetime.now(timezone.utc) + timedelta(hours=1),
        "sub": subject
    }
    print(payload)
    token = jwt.encode(
        payload,
        SECRET_KEY,
        algorithm="HS256"
    )

    return token


def decode_authorization_token(authorization_token):
    payload = jwt.decode(
        exact_authorization_token(authorization_token),
        SECRET_KEY,
        algorithms="HS256"
    )

    return payload


def exact_authorization_token(authorization_token):
    split_token = str.split(authorization_token)
    exact_token = ""
    if(len(split_token) == 2):
        exact_token = split_token[1]
    else:
        exact_token = split_token

    return exact_token


def full_authorization_token(authorization_token):
    return "Bearer " + authorization_token


def refresh_authorization_token(request, response):
    existing_token = request.get_header("Authorization")
    if existing_token:
        decoded_token = decode_authorization_token(existing_token)
        if decoded_token:
            timestamp = decoded_token["iat"]
            issued_at = datetime.fromtimestamp(timestamp, timezone.utc)
            subject = decoded_token["sub"]
            if issued_at + timedelta(minutes=15) <= datetime.now(timezone.utc):
                encoded_token = encode_authorization_token(subject)
                new_token = full_authorization_token(encoded_token)
                response.set_header("Authorization", new_token)
                return True
    return False


def set_authorization_token(subject, response):
    token = encode_authorization_token(subject)
    if token:
        full_token = full_authorization_token(token)
        response.set_header("Authorization", full_token)
        return True
    return False

