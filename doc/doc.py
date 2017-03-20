"""Musilitar API - Doc"""
import hug


@hug.call("/docs", ["GET"], versions=1)
def docs(hug_api, hug_api_version):
    """Shows the generated documentation"""
    return hug_api.http.documentation(api_version=hug_api_version)
