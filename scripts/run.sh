#!/bin/bash

/root/bin/postBuildTasks.sh
exec supervisord -n
