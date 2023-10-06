# IT211

## Config database
Create yourown database and then change database name according to your actual database name inside "IT211\Django-Project\school_admission\school_admission\settings.py". 
```
# Database
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "YOUR_DATABASE_NAME",
        "USER": "root",
        "PASSWORD": "",
        "HOST": "127.0.0.1",
        "PORT": "3306",
        'OPTIONS': {
            'sql_mode': 'STRICT_TRANS_TABLES',
        }
    }
}
```
## Migrate database
To get tables into your database, turn on your database server, and then open your database connection.  
Run the following command:
```
python manage.py migrate
```
## Install required packages
Go to: IT211/django-project/school_admission 
Install all the required packages by running the following command:
```
pip install -r requirements.txt
```
## Run the server
```
python manage.py runserver
```
