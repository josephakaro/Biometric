from flask import Blueprint, render_template

view = Blueprint('view', __name__, template_folder='tamplates')


@view.route('/register')
def Index():
    return render_template('register.html')