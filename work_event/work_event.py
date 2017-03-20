"""Musilitar API - Work event"""
import dataset
import hug


db = dataset.connect("sqlite:///MusilitarAPI.db")


@hug.call(("/work_events", "/work_events/{work_event_id}"), ["POST", "GET"], versions=1)
def home(request, work_event_id=None, body=None):
    """REST endpoint for home events"""
    work_events = db["work_events"]
    if request.method == "GET":
        if work_event_id:
            return work_events.find_one(id=work_event_id)
        else:
            return work_events.all()
    if request.method == "POST":
        pk = work_events.insert(body)
        return work_events.find_one(id=pk)
