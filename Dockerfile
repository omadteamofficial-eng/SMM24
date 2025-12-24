# PHP 8.2 va Apache serveriga asoslangan rasm
FROM php:8.2-apache

# Tizim paketlarini yangilash va PHP kengaytmalari uchun kerakli kutubxonalarni o'rnatish
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libxml2-dev \
    libonig-dev \
    libpng-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# PHP kengaytmalarini o'rnatish (Sizning kodingiz uchun mysqli va curl shart)
RUN docker-php-ext-install mysqli curl mbstring xml bcmath gd

# Apache mod_rewrite modullarini yoqish (URLlar to'g'ri ishlashi uchun)
RUN a2enmod rewrite

# Ishchi katalogni belgilash
WORKDIR /var/www/html

# Loyiha fayllarini konteyner ichiga nusxalash
COPY . /var/www/html/

# Fayl ruxsatlarini Apache foydalanuvchisiga (www-data) berish
# Bu mkdir va file_put_contents funksiyalari xatosiz ishlashi uchun kerak
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Apache portini ochish
EXPOSE 80

# Apache serverini ishga tushirish
CMD ["apache2-foreground"]

