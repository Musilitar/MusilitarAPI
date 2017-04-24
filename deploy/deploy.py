"""Musilitar API - Deploy"""
import hug
from subprocess import check_call


@hug.call("/deploy", ["POST"], versions=1)
def docs():
    """Trigger a deployment of the application"""
    check_call(["git", "--work-tree=/home/Musilitar/MusilitarAPI", "--git-dir=/home/Musilitar/MusilitarAPI/.git", "pull"])
    check_call(["touch", "/var/www/www_musilitar_org_wsgi.py"])
    return {"status": "deployed"}
