FROM debian:bookworm-slim

# نصب ابزارهای پایه و شبکه
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# دانلود نسخه باینری و استاندارد ttyd (ترمینال تحت وب)
RUN curl -Lo /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 \
    && chmod +x /usr/local/bin/ttyd

ENV HOME=/root
WORKDIR /root

EXPOSE 7860

# اجرای ترمینال مستقیم روی پورت هاگینگ فیس با دسترسی بش
CMD ["ttyd", "-p", "7860", "bash"]
