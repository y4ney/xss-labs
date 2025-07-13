# 使用官方带 Apache 的 PHP 8.1 镜像作为基础
FROM php:8.1-apache

# 维护者信息（可选）
LABEL maintainer="yaney yangli.yaney@gmail.com"

# 复制项目文件到 Apache 默认站点目录
COPY ./ /var/www/html/

# 设置文件权限，确保 Apache 可读写（www-data）
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 750 /var/www/html

# 禁用 Apache 的目录浏览，防止源码泄露
RUN echo "<Directory /var/www/html/>" > /etc/apache2/conf-available/security.conf \
    && echo "    Options -Indexes" >> /etc/apache2/conf-available/security.conf \
    && echo "    AllowOverride None" >> /etc/apache2/conf-available/security.conf \
    && echo "    Require all granted" >> /etc/apache2/conf-available/security.conf \
    && echo "</Directory>" >> /etc/apache2/conf-available/security.conf \
    && a2enconf security

# 可以根据需要禁用不必要的 Apache 模块，减少攻击面
RUN a2dismod -f status autoindex

# 设置环境变量，关闭 Apache 服务器签名，隐藏版本信息（安全考虑）
RUN echo "ServerTokens Prod" >> /etc/apache2/conf-available/security.conf \
    && echo "ServerSignature Off" >> /etc/apache2/conf-available/security.conf

# 监听端口（可选，php:apache 默认监听80端口）
EXPOSE 80

# 使用官方默认启动命令，无需改动
CMD ["apache2-foreground"]

