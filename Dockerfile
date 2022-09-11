# Ultroid - UserBot

# Copyright (C) 2021-2022 TeamUltroid

# This file is a part of < https://github.com/TeamUltroid/Ultroid/ >

# PLease read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

FROM theteamultroid/ultroid:main

# set timezone

ENV TZ=Asia/Kolkata

RUN rm -rf /root/TeamUltroid/

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN git clone https://github.com/SAJALMAURYA/Ultroid-1.git /root/TeamUltroid/

# changing workdir

WORKDIR /root/TeamUltroid/

RUN rm -rf requirements.txt

COPY requirements.txt /root/TeamUltroid

RUN pip3 install -U -r requirements.txt

COPY .env /root/TeamUltroid

# start the bot.

CMD ["bash", "startup"]
