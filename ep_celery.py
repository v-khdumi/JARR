#! /usr/bin/env python
# -*- coding: utf-8 -*-
from celery import Celery
from jarr.bootstrap import conf

celery_app = Celery(broker=conf.celery.broker,
        backend=conf.celery.backend,
        config_source=conf.celery)
