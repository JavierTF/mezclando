from django.shortcuts import render
from django.urls import reverse_lazy
from django.utils.encoding import force_str
from django.contrib.auth.models import Group, User, Permission
from django.views.generic import UpdateView
from django.views.generic.edit import BaseUpdateView, DeleteView
from notifications.signals import notify
from PIL import Image
from captcha.fields import CaptchaField
from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib import messages
from django.core.exceptions import ImproperlyConfigured
from django.forms import widgets
from django.http import HttpResponseRedirect
from django.contrib.admin.models import LogEntry
from ProyectoBaseApp import models
from . import utils
from django.forms import ValidationError
from ProyectoBaseApp.utils import register_logs

# class SignUpForm(UserCreationForm):
#     captcha = CaptchaField()
#     email = forms.EmailField(max_length=254)
#
#     class Meta:
#         model = models.UserApp
#         fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2',)
#
#     def __init__(self, *args, **kwargs):
#         super(SignUpForm, self).__init__(*args, **kwargs)
#
#         self.fields['username'].widget.attrs['class'] = 'form-control'
#         self.fields['username'].widget.attrs['placeholder'] = 'Usuario'
#         self.fields['email'].widget.attrs['class'] = 'form-control'
#         self.fields['email'].widget.attrs['placeholder'] = 'Correo'
#         self.fields['first_name'].widget.attrs['class'] = 'form-control'
#         self.fields['first_name'].widget.attrs['placeholder'] = 'Su Nombre'
#         self.fields['last_name'].widget.attrs['class'] = 'form-control'
#         self.fields['last_name'].widget.attrs['placeholder'] = 'Sus Apellidos'
#         self.fields['password1'].widget.attrs['class'] = 'form-control'
#         self.fields['password1'].widget.attrs['placeholder'] = 'Contraseña'
#         self.fields['password1'].widget.attrs['minlength'] = '8'
#         self.fields['password2'].widget.attrs['class'] = 'form-control'
#         self.fields['password2'].widget.attrs['placeholder'] = 'Repita la Contraseña'
#         self.fields['password2'].widget.attrs['minlength'] = '8'
#         self.fields['captcha'].widget.attrs['class'] = 'form-control'
#         self.fields['captcha'].widget.attrs['placeholder'] = 'Captcha'
#
#     def clean_email(self):
#         email = self.cleaned_data.get('email')
#         list_errores = utils.validate_correo(self.cleaned_data.get('email'))
#         if len in list_errores > 0:
#             for u in list_errores:
#                 raise forms.ValidationError(u)
#         return self.cleaned_data.get('email')
        # Get the email
        #
        # Check to see if any users already exist with this email as a username.
        # try:
        #     if len(str(email).split("gmail")) > 1:
        #         if len(str(email).split("+")) > 1:
        #             part = str(email).split("@")
        #             if len(part) > 1:
        #                 email = str(part[0]).split("+")[0] + str(part[1])
        #     match = models.UserApp.objects.get(email=email)
        # except models.UserApp.DoesNotExist:
        #     Unable to find a user, this is fine
            # return email
        # A user was found with this as a username, raise an error.
        # raise forms.ValidationError('Este email ya esta en uso.')

    # def clean_username(self):
    #     Get the email
        # usernam = self.cleaned_data.get('username')
        #
        # Check to see if any users already exist with this email as a username.
        # try:
        #     match = models.UserApp.objects.get(username=usernam)
        # except models.UserApp.DoesNotExist:
            # Unable to find a user, this is fine
            # return usernam

        # A user was found with this as a username, raise an error.
        # raise forms.ValidationError('Este nombre de usuario ya esta en uso')


class GroupForm(forms.ModelForm):
    permissions = forms.ModelMultipleChoiceField(queryset = Permission.objects.all(), required = True, label = 'Permisos*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on', 'placeholder': 'Rol', 'style': 'height: 400px'}))

    class Meta:
        model = Group
        fields = "__all__"
        widgets = {
            "name": widgets.TextInput(attrs={'class': ' form-control', 'placeholder': 'Introduzca el nombre'}),
        }

class GroupUpdate(UpdateView):
    form_class = GroupForm
    model = Group
    success_url = reverse_lazy('group_list')

    def post(self, request, *args, **kwargs):
        register_logs(request, Group, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Rol modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)


class GroupDelete(DeleteView):
    model = Group
    success_url = reverse_lazy('group_list')

    def delete(self, request, *args, **kwargs):
        register_logs(request, Group, self.get_object().pk, self.get_object().__str__(), 3)
        self.object = self.get_object()
        success_url = self.get_success_url()
        self.object.delete()
        messages.success(request, "Rol eliminado con éxito")
        return HttpResponseRedirect(success_url)


class UserForm(UserCreationForm):
    # captcha = CaptchaField()
    def clean_email(self):
        correo_current_user = self.cleaned_data['email']
        if models.UserApp.objects.filter(email=correo_current_user)[:1].count() > 0:
            raise ValidationError("El correo ya está en uso")
        list_error= utils.validate_correo(self.cleaned_data.get('email'))
        if len(list_error) > 0:
            for i in list_error:
                raise forms.ValidationError(i)        
        return self.cleaned_data.get('email')

    # username = forms.CharField(label = 'Nombre de prueba', max_length = 25, required = False)
    # email = forms.EmailField(label = 'Correo electrónico de CITMATEL', max_length = 80, required = False)
    # first_name = forms.CharField(label = 'Nombre', max_length = 25, required = False)
    # username = forms.CharField(label = 'Nombre de usuario*', max_length = 25, required = False)
    # groups = forms.ModelMultipleChoiceField(queryset = Group.objects.all(), required = True, label = 'Roles/Grupos*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # groups = forms.ModelMultipleChoiceField(queryset = Group.objects.all(), required = True, label = 'Roles/Grupos*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # groups = forms.ModelMultipleChoiceField(queryset = Group.objects.all(), required = True, label = 'Roles/Grupos*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    groups = forms.ModelMultipleChoiceField(queryset = Group.objects.all(), required = True, label = 'Roles/Grupos*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model = models.UserApp
        fields = [
            'username',
            'email',
            'first_name',
            'last_name',
            'password1',
            'password2',
            'groups',
            'image',
        ]
        widgets = {
            "username": widgets.TextInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre de usuario'}),
            "email": widgets.EmailInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca dirección de correo'}),
            "first_name": widgets.TextInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}),
            "last_name": widgets.TextInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca los apellidos'}),
            "password1": widgets.PasswordInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la contraseña'}),
            "password2": widgets.PasswordInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la contraseña nuevamente'}),         
            "image": widgets.ClearableFileInput(attrs={'class': ' form-control','accept':'image/*'}),
        }

class UserProfile(forms.ModelForm):
    class Meta:
        model = models.UserApp
        fields = [
            'image',
        ]
        widgets = {
            "image": widgets.ClearableFileInput(attrs={'class': ' form-control','accept':'image/*'}),
        }

# class UserAdminProfile(forms.ModelForm):

#     class Meta:
#         model = models.UserApp
#         fields = [
#             'username',
#             'first_name',
#             'email',
#             'last_name',
#             'groups',
#             'is_active',
#             'image',
#         ]
#         widgets = {

#             "username": widgets.TextInput(attrs={'class': ' form-control'}),
#             "first_name": widgets.TextInput(attrs={'class': ' form-control','required':'required'}),
#             "last_name": widgets.TextInput(attrs={'class': ' form-control','required':'required'}),
#             "email": widgets.EmailInput(attrs={'class': ' form-control'}),
#             "groups": widgets.SelectMultiple(attrs={'class': ' form-control'}),
#             "is_active": widgets.CheckboxInput(attrs={'class': ' form-control'}),
#             "image": widgets.ClearableFileInput(attrs={'class': ' form-control','accept':'image/*'}),

#         }
#     def clean_email(self):
#         list_error = utils.validate_correo(self.cleaned_data.get('email'))
#         correo_current_user = self.cleaned_data['email']
#         if len(list_error) > 0:
#             for i in list_error:
#                 raise forms.ValidationError(i)
#         if models.UserApp.objects.filter(email=correo_current_user).count() > 0:
#             raise ValidationError("El correo ya está en uso")
#         return self.cleaned_data.get('email')

#     def clean(self):
#         id_current_user = self.data.get('id')
#         nombre_current_user = models.UserApp.objects.get(id=id_current_user).first_name
#         apellidos_current_user = models.UserApp.objects.get(id=id_current_user).last_name
#         username_current_user = models.UserApp.objects.get(id=id_current_user).username

#         list_excluding = models.UserApp.objects.all().exclude(first_name=nombre_current_user,
#                                                               last_name=apellidos_current_user)
#         list_excluding_username = models.UserApp.objects.all().exclude(username=username_current_user)

#         nombre_form = self.cleaned_data['first_name']
#         apellidos_form = self.cleaned_data['last_name']
#         username_form = self.cleaned_data['username']

#         for u in list_excluding:
#             if u.first_name == nombre_form and u.last_name == apellidos_form:
#                 self.add_error('first_name', 'Ya existe un usuario con este nombre')
#                 self.add_error('last_name', 'Ya existe un usuario con estos apellidos')

#         for u in list_excluding_username:
#             if u.username == username_form:
#                 self.add_error('username', 'Nombre de usuario ya registrado')

class UserAdminProfile(UserCreationForm):
    def __init__(self, *args, **kwargs):
        super(UserAdminProfile, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['username'].required = False
        self.fields['password1'].required = False

    def clean_email(self):
        correo_current_user = self.cleaned_data['email']
        if models.UserApp.objects.filter(email=correo_current_user).count() > 0:
            raise ValidationError("El correo ya está en uso")
        list_error= utils.validate_correo(self.cleaned_data.get('email'))
        if len(list_error) > 0:
            for i in list_error:
                raise forms.ValidationError(i)        
        return self.cleaned_data.get('email')

    groups = forms.ModelMultipleChoiceField(queryset = Group.objects.all(), required = True, label = 'Roles/Grupos*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model = models.UserApp
        fields = [
            'username',
            'email',
            'first_name',
            'last_name',
            'password1',
            'password2',
            'groups',
            'image',
        ]
        widgets = {
            "username": widgets.TextInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre de usuario'}),
            "email": widgets.EmailInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca dirección de correo'}),
            "first_name": widgets.TextInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}),
            "last_name": widgets.TextInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca los apellidos'}),
            "password1": widgets.PasswordInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la contraseña'}),
            "password2": widgets.PasswordInput(attrs={'class': ' form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la contraseña nuevamente'}),         
            "image": widgets.ClearableFileInput(attrs={'class': ' form-control','accept':'image/*'}),
        }

    def clean(self):
        id_current_user = self.data.get('id')
        nombre_current_user = models.UserApp.objects.get(id=id_current_user).first_name
        apellidos_current_user = models.UserApp.objects.get(id=id_current_user).last_name
        username_current_user = models.UserApp.objects.get(id=id_current_user).username

        list_excluding = models.UserApp.objects.all().exclude(first_name=nombre_current_user,
                                                              last_name=apellidos_current_user)
        list_excluding_username = models.UserApp.objects.all().exclude(username=username_current_user)

        nombre_form = self.cleaned_data['first_name']
        apellidos_form = self.cleaned_data['last_name']
        username_form = self.cleaned_data['username']

        for u in list_excluding:
            if u.first_name == nombre_form and u.last_name == apellidos_form:
                self.add_error('first_name', 'Ya existe un usuario con este nombre')
                self.add_error('last_name', 'Ya existe un usuario con estos apellidos')

        for u in list_excluding_username:
            if u.username == username_form:
                self.add_error('username', 'Nombre de usuario ya registrado')

class UserUpdateAdmin(UpdateView):
    model = models.UserApp
    form_class = UserProfile
    template_name = ('auth/profile.html')
    success_url = reverse_lazy('inicio')

    def get(self, request, *args, **kwargs):
        if request.user.pk == self.get_object().pk:
            self.object = self.get_object()
            return super(BaseUpdateView, self).get(request, *args, **kwargs)
        else:
            return render(request,'Security/404.html')

    def post(self, request, *args, **kwargs):
        register_logs(request, models.UserApp, self.get_object().uui, self.get_object().__str__(), 2)
        notify.send(request.user, recipient=self.get_object(), verb='Se han modificado sus datos', level='warning')
        self.object = self.get_object()
        messages.success(request, "Usuario modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

    def get_success_url(self):
        if self.success_url:
            if self.request.POST.get('x') != "":
                x = float(self.request.POST.get('x'))
                y = float(self.request.POST.get('y'))
                w = float(self.request.POST.get('width'))
                h = float(self.request.POST.get('height'))

                image = Image.open(self.get_object().image)
                cropped_image = image.crop((x, y, w + x, h + y))
                resized_image = cropped_image.resize((200, 200), Image.ANTIALIAS)
                resized_image.save(self.get_object().image.path)
            url = force_str(self.success_url)
        else:
            raise ImproperlyConfigured(
                "No URL to redirect to. Provide a success_url.")
        return url

class UserUpdate(UpdateView):
    print('YA LLEGUE UPDATE')
    model = models.UserApp
    form_class = UserAdminProfile
    template_name = ('auth/user_update.html')
    success_url = reverse_lazy('user_list')

    def post(self, request, *args, **kwargs):
        form = self.get_form(UserAdminProfile)  
        self.object = self.get_object()
        us = models.UserApp.objects.filter(pk = self.get_object().pk)

        us.update(
            username = form['username'].value(),
            email = form['email'].value(),
            first_name = form['first_name'].value(),
            last_name = form['last_name'].value(),   
            password1 = form['password1'].value(),   
            password2 = form['password2'].value(),   
            image = form['image'].value(),   
        )

        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        mus = models.UserApp.objects.get(pk = self.get_object().pk)

        mus.groups.clear()
        grupos = form['groups'].value()
        for f in grupos:
            try:
                felem = Group.objects.get(id = f)
                mus.groups.add(felem)
            except:
                pass
        
        mus.save()

        notify.send(request.user, recipient=self.get_object(), verb='Se han modificado sus datos', level='warning')
        register_logs(request, models.UserApp, self.get_object().uui, self.get_object().__str__(), 2)
        messages.success(request, "Usuario modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class UserDetail(UpdateView):
    model = models.UserApp
    form_class = UserAdminProfile
    template_name = ('auth/user_detail.html')
    success_url = reverse_lazy('user_list')

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        register_logs(request, models.UserApp, self.get_object().uui, self.get_object().__str__(), 0)
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class UserDelete(DeleteView):
    model = User
    success_url = reverse_lazy('user_list')

    def delete(self, request, *args, **kwargs):
        register_logs(request, models.UserApp, self.get_object().pk, self.get_object().__str__(), 3)
        self.object = self.get_object()
        success_url = self.get_success_url()
        if LogEntry.objects.filter(user_id = self.get_object().pk).count() == 0:
            self.object.delete()
            messages.success(request, "Usuario eliminado con éxito")
        else:
            messages.error(request, "El usuario posee datos de interés para la entidad por tanto no se puede borrar")
        return HttpResponseRedirect(success_url)

class UserActivate(UpdateView):
    model = models.UserApp
    form_class = UserAdminProfile
    # template_name = ('auth/user_form.html')
    success_url = reverse_lazy('user_list')

    def post(self, request, *args, **kwargs):
        formu = self.get_form(UserAdminProfile)
        register_logs(request, models.UserApp, self.get_object().uui, self.get_object().__str__(), 2)
        notify.send(request.user, recipient=self.get_object(), verb='Se han modificado sus datos', level='warning')
        self.object = self.get_object()
        if not formu.errors:
            messages.success(request, "Usuario modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)