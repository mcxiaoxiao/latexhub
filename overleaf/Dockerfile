FROM sharelatex/sharelatex:5

RUN rm /etc/my_init.d/000_check_for_old_env_vars_5.sh \
 && rm /etc/my_init.d/100_make_overleaf_data_dirs.sh

COPY ./init_scripts/100_make_overleaf_data_dirs.sh /etc/my_init.d/100_make_overleaf_data_dirs.sh
COPY ./nginx/nginx.conf.template /etc/nginx/templates/nginx.conf.template
COPY ./runit/chat-overleaf/run /etc/service/chat-overleaf/run
COPY ./runit/clsi-overleaf/run /etc/service/clsi-overleaf/run
COPY ./runit/contacts-overleaf/run /etc/service/contacts-overleaf/run
COPY ./runit/docstore-overleaf/run /etc/service/docstore-overleaf/run
COPY ./runit/document-updater-overleaf/run /etc/service/document-updater-overleaf/run
COPY ./runit/filestore-overleaf/run /etc/service/filestore-overleaf/run
COPY ./runit/history-v1-overleaf/run /etc/service/history-v1-overleaf/run
COPY ./runit/notifications-overleaf/run /etc/service/notifications-overleaf/run
COPY ./runit/project-history-overleaf/run /etc/service/project-history-overleaf/run
COPY ./runit/real-time-overleaf/run /etc/service/real-time-overleaf/run
COPY ./runit/spelling-overleaf/run /etc/service/spelling-overleaf/run
COPY ./runit/web-api-overleaf/run /etc/service/web-api-overleaf/run
COPY ./runit/web-overleaf/run /etc/service/web-overleaf/run

RUN chmod +x /etc/my_init.d/100_make_overleaf_data_dirs.sh \
 /etc/service/chat-overleaf/run \
 /etc/service/clsi-overleaf/run \
 /etc/service/contacts-overleaf/run \
 /etc/service/docstore-overleaf/run \
 /etc/service/document-updater-overleaf/run \
 /etc/service/filestore-overleaf/run \
 /etc/service/history-v1-overleaf/run \
 /etc/service/notifications-overleaf/run \
 /etc/service/project-history-overleaf/run \
 /etc/service/real-time-overleaf/run \
 /etc/service/spelling-overleaf/run \
 /etc/service/web-api-overleaf/run \
 /etc/service/web-overleaf/run
 

