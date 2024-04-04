using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PracticeAt.Pages
{
    /// <summary>
    /// Логика взаимодействия для Operator.xaml
    /// </summary>
    public partial class Operator : Page
	{
		private ObservableCollection<Order> OrdersData = new ObservableCollection<Order>();

		public Operator()
        {
            InitializeComponent();
			LoadData();

		}
		private void LoadData()
		{
			try
			{
				using (var context = new AtelieContext())
				{
					var data = context.Orders.OrderBy(o => o.Orderid).ToList();
					OrdersData.Clear();
					foreach (var item in data)
					{
						OrdersData.Add(item);
					}
				}
				dataGrid.ItemsSource = OrdersData;
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
		}
		private void Add_Click(object sender, RoutedEventArgs e)
		{
			var newOrder = new Order();
			try
			{
				OrdersData.Add(newOrder);
			}
			catch (Exception ex)
			{
				MessageBox.Show($"Ошибка: {ex.Message}");
			}
		}
		private void Save_Click(object sender, RoutedEventArgs e)
		{
			try
			{
				using (var context = new AtelieContext())
				{
					foreach (var o in OrdersData)
					{
						if (o.Orderid == 0)
						{
							// Добавляем нового сотрудника в базу данных
							context.Orders.Add(o);
						}
						else
						{
							var entity = context.Orders.Find(o.Orderid);
							if (entity != null)
							{
								entity.Clientid = o.Clientid;
								entity.OrderDate = o.OrderDate;
								entity.Status = o.Status;
								entity.Description = o.Description;
							}
						}
					}
					context.SaveChanges();
				}

				MessageBox.Show("Изменения сохранены.");
				LoadData();
			}
			catch (Exception ex)
			{
				MessageBox.Show($"Ошибка при сохранении данных: {ex.Message}");
			}
		}

		private void Back_Click(object sender, RoutedEventArgs e)
		{
			NavigationService.Navigate(new Autho());
		}
	}
}
