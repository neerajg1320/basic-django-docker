docker build .

docker compose run app sh -c "django-admin startproject app ."
docker compose run app sh -c "python manage.py startapp core"

docker compose run app sh -c "python manage.py test"

# After creating custom user
docker compose run app sh -c "python manage.py makemigrations core"


docker compose run app sh -c "python manage.py createsuperuser"