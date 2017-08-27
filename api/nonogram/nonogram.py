"""Musilitar API - Serve"""
import hug


@hug.call("/nonogram", ["GET"], versions=1)
def nonogram():
    return {}