"""Musilitar API - Home event"""
import dataset
import hug


db = dataset.connect("sqlite:///MusilitarAPI.db")


@hug.call(("/home_events", "/home_events/{home_event_id}"), ["POST", "GET"], versions=1)
def home(request, home_event_id=None, body=None):
    """REST endpoint for home events"""
    home_events = db["home_events"]
    if request.method == "GET":
        if home_event_id:
            return home_events.find_one(id=home_event_id)
        else:
            return home_events.all()
    if request.method == "POST":
        pk = home_events.insert(body)
        return home_events.find_one(id=pk)
