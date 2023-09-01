from django.views import *
from . models import *
from django.utils import timezone
from django.shortcuts import render, redirect
from datetime import datetime, date, time
from django.views.generic import ListView, CreateView, UpdateView
from django.urls import reverse_lazy
from django.http import JsonResponse

class IndexView(View):
    template_name = 'index/index.html'

    def get(self, request, *args, **kwargs):
        context = {
            'title': "Index",
            'shift': Shift.objects.all(),
            'expired': Expired.objects.filter(year=timezone.now().year),
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
            'major': Major.objects.select_related('department').values(
                'id',
                'title',
                'description',
                'department__title',
                'department__icon'
            ),
            'department': Department.objects.all(),
            'tuition_fee': TuitionFee.objects.select_related('level').all(),
            'rating': Ratings.objects.all(),
            'contacts': Contact.objects.all().exclude(id=1),
            'contacts_footer': Contact.objects.filter(id__range=(2, 4)).order_by('-id'),
        }

        return render(request, self.template_name, context)


class RegisterView(View):
    def get(self, request, *args, **kwargs):
        register_form = FormReg.objects.first()

        if register_form and register_form.form:
            template_name = "index/register-multi.html"
        else:
            template_name = "index/register.html"

        expired_data = Expired.objects.filter(year=datetime.now().year)

        if expired_data.exists():
            for data in expired_data:
                expired_date = data.expired_date

            expiration_datetime = datetime.combine(expired_date, time())
            current_datetime = datetime.now()

            expiration_timestamp = expiration_datetime.timestamp()
            current_timestamp = current_datetime.timestamp()

            if current_timestamp > expiration_timestamp:
                return redirect('expiredPage')
            
        context = {
            'title': "Register",
            'sex': Sex.objects.all(),
            'marital': Married.objects.all(),
            'relation': Relationship.objects.all(),
            'level': Level.objects.all(),
            'major': Major.objects.all(),
            'shift': Shift.objects.all(),
            'payment': Payment.objects.all(),
            'expired': expired_data,
        }

        return render(request, template_name, context)
    
class ExpiredView(View):
    template_name = 'index/expired.html'

    def get(self, request, *args, **kwargs):
        context = {
            'title': "Index",
            'shift': Shift.objects.all(),
            'expired': Expired.objects.filter(year=timezone.now().year),
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
            'major': Major.objects.select_related('department').values(
                'id',
                'title',
                'description',
                'department__title',
                'department__icon'
            ),
            'department': Department.objects.all(),
            'tuition_fee': TuitionFee.objects.select_related('level').all(),
        }

        return render(request, self.template_name, context)
    
class AdmissionView(View):
    template_name = 'index/admission.html'

    def get(self, request, *args, **kwargs):
        context = {
            'title': "My Admission",
            'shift': Shift.objects.all(),
            'expired': Expired.objects.filter(year=timezone.now().year),
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
            'major': Major.objects.select_related('department').values(
                'id',
                'title',
                'description',
                'department__title',
                'department__icon'
            ),
            'department': Department.objects.all(),
            'tuition_fee': TuitionFee.objects.select_related('level').all(),
        }

        return render(request, self.template_name, context)
    

def get_major_options(request):
    level_id = request.GET.get('level_id')
    majors = Major.objects.filter(department__level_id=level_id)
    options = [{'id': major.id, 'title': major.title} for major in majors]
    
    return JsonResponse(options, safe=False)