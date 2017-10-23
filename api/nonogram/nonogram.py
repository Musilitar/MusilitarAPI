import hug

from auth.auth import verify_authorization_token


@hug.call("/nonogram", ["GET"], versions=1, requires=verify_authorization_token)
def nonogram():
    return {}