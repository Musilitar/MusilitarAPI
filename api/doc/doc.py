import hug

from auth.auth import verify_authorization_token


@hug.call("/docs", ["GET"], versions=1, requires=verify_authorization_token)
def docs(hug_api, hug_api_version):
    """Shows the generated documentation"""
    return hug_api.http.documentation(api_version=hug_api_version)
