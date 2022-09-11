
RECORDED_PATH=$1
ROOM_URL=`jq --raw-output ".meeting_url" ${RECORDED_PATH}/metadata.json`
ROOM_ID=${ROOM_URL##*/}
MEDIA_FILE=`ls ${RECORDED_PATH}/*.mp4 | head -n 1`

#echo $ROOM_URL
#echo $ROOM_ID
#echo $MEDIA_FILE

FILE_NAME=$MEDIA_FILE

BOOMSTREAM_SERVER_NODE=57
BOOMSTREAM_PATH_MEDIA=/upload
APP_ID=31097

# Get download path
DATE=$(date "+%Y/%m/%d")
BASENAME=$(basename "${FILE_NAME}")
EXTENSION="${BASENAME##*.}"
HASH=$(echo "${DATE}/${FILE_NAME}" | md5sum | cut -d ' ' -f 1)
DOWNLOAD_PATH=/m${BOOMSTREAM_SERVER_NODE}/${DATE}/${HASH}.${EXTENSION}

if [ -f "${FILE_NAME}" ]; then
    # Wait for several seconds
    sleep 10

    # Move file
    mkdir -p $(dirname "${BOOMSTREAM_PATH_MEDIA}${DOWNLOAD_PATH}")
    mv "${FILE_NAME}" "${BOOMSTREAM_PATH_MEDIA}${DOWNLOAD_PATH}"

    # Send API call
    #curl "https://boomstream.com/api/task/download?app=${FTP_USERNAME}&node=${BOOMSTREAM_SERVER_NODE}&file=${DOWNLOAD_PATH}&title=${BASENAME}"
    echo curl \
      --data-urlencode "app=${APP_ID}" \
      --data-urlencode "room=${ROOM_ID}" \
      --data-urlencode "node=${BOOMSTREAM_SERVER_NODE}" \
      --data-urlencode "file=${DOWNLOAD_PATH}" \
      --data-urlencode "title=${BASENAME}" \
      https://boomstream.com/api/task/download
fi
