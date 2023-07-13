#!/bin/bash
set -e
source /etc/profile

# Run the main Celery beat worker
cd "${KOBOCAT_SRC_DIR}"
exec celery -A onadata beat --loglevel=info \
    --logfile=${KOBOCAT_LOGS_DIR}/celery_beat.log \
    --pidfile=${CELERY_PID_DIR}/celery_beat.pid \
    --scheduler django_celery_beat.schedulers:DatabaseScheduler \
    --uid=${UWSGI_USER} \
    --gid=${UWSGI_GROUP}
