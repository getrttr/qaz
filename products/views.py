from django.shortcuts import render


def index(request):
    return render(request, 'products/index.html')


def products(request):
    return render(request, 'products/products.html')

def context(request):
    context = { 'title':'Store',
                   'header':'Салам ежжжжжжжжжжжи!',
                   'username':'Костянчик',}
    return render(request, 'products/context.html', context)