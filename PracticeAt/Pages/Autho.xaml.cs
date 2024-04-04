using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using PracticeAt.Pages;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Npgsql;

namespace PracticeAt.Pages
{
    /// <summary>
    /// Логика взаимодействия для Autho.xaml
    /// </summary>
    public partial class Autho : Page
    {
        public Autho()
        {
            InitializeComponent();
        }

		private void btnEnter_Click(object sender, RoutedEventArgs e)
		{

			using (var context = new AtelieContext())
			{
				var login = txtbLogin.Text.Trim();
				var password = pswdPassword.Password.Trim();

				var user = context.Users.FirstOrDefault(u => u.Login == login && u.Password == password);
				var worker = context.Workers.FirstOrDefault(w => w.Userid == user.Userid);
				if (worker != null)
				{
					switch (worker.Positionid)
					{
						case 1:
							MessageBox.Show("Вы вошли под ролью Оператора", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
							NavigationService.Navigate(new Operator());
							break;
						case 3:
							MessageBox.Show("Вы вошли под ролью Менеджер", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
							NavigationService.Navigate(new Manager());
							break;
						default:
							MessageBox.Show("Нет допуска", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
							break;
					}
				}
				else
				{
					MessageBox.Show("Логин или пароль введены неверно.", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Error);
				}
			}
		}
    }
}
