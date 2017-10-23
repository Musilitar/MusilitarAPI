import hug
from subprocess import check_call
from falcon import HTTP_200, HTTP_400


@hug.call("/deploy", ["POST"], versions=1)
def docs(response):
    """Trigger a deployment of the application"""
    check_call(["git", "pull"], cwd="/home/Musilitar/MusilitarAPI")
    check_call(["pipenv", "install", "--skip-lock"], cwd="/home/Musilitar/MusilitarAPI")
    check_call(["touch", "/var/www/www_musilitar_org_wsgi.py"])
    response.status = HTTP_200
