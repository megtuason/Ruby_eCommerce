class Order < ApplicationRecord
	before_create :randomize_id
	before_save {self.email = email.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
	presence: true,
	length: {maximum: 100},
	uniqueness: { case_sensitivity: false},
	format: {with: VALID_EMAIL_REGEX}
	validates :customer_name, presence: true, length: { maximum: 40 }
	validates :customer_address, presence: true, length: { maximum: 10 }
	validates :street, presence: true, length: { maximum: 40 }
	validates :city, presence: true, acceptance: { accept: ['Abucay', 'Agoncillo', 'Angeles City', 'Apalit', 'Bacolod City', 'Bacolor', 'Bacoor', 'Baguio City', 'Balagtas', 'Balanga', 'Balayan', 'Baliuag', 'Bamban', 'Baras', 'Batangas City', 'Bauan', 'Bay', 'Binan', 'Binangonan', 'Binmaley', 'Bocaue', 'Bugallon', 'Bustos', 'Cabanatuan City', 'Cabuyao', 'Cagayan De Oro City', 'Cainta', 'Calamba', 'Calauan', 'Calbayog City', 'Caloocan City', 'Calumpit', 'Camaligan', 'Canaman', 'Candelaria', 'Capas', 'Cardona', 'Carmona', 'Cauayan City', 'Cavite City', 'Cebu City', 'Compostela', 'Concepcion', 'Cosolacion', 'Cordova', 'Cotabato City', 'Dagupan City', 'Daraga', 'Dasmarinas', 'Dauis', 'Davao City', 'Dinalupihan', 'General Mariano Alvarez', 'General Santos City', 'General Trias', 'Gerona', 'Guiguinto', 'Guimba', 'Hagonoy', 'Hermosa', 'Iloilo City', 'Imus', 'Kawit', 'Laoag City', 'Lapu-lapu City', 'Las Pinas City', 'Legazpi City', 'Lemery', 'Liloan', 'Lingayen', 'Lipa City', 'Los Baños', 'Lucena City', 'Mabalacat', 'Makati City', 'Malabon City', 'Malolos City', 'Malvar', 'Mandaluyong City', 'Mandaue City', 'Manila City', 'Marikina City', 'Marilao', 'Mataas na Kahoy', 'Mexico', 'Meycauayan', 'Minalin', 'Minglanilla', 'Morong', 'Muntinlupa City', 'Naga City', 'NAIC', 'Navotas City', 'Noveleta', 'Olangapo City', 'Padre Garcia', 'Pagbilao', 'Pandi', 'Paniqui', 'Paombong', 'Parañaque City', 'Pasay City', 'Pasig City', 'Pateros', 'Pavia', 'Peñablanca', 'Pilar', 'Pililla', 'Plaridel', 'Porac', 'Puerto Princesa City', 'Pulilan', 'Quezon City', 'Rodriguez', 'Rosales', 'Rosario', 'Roxas City', 'San Fernando City', 'San J. Del Monte', 'San Juan City', 'San Luis', 'San Mateo', 'San Miguel', 'San Nicolas', 'San Pablo City', 'San Pascaul', 'San Pedro', 'San Rafael', 'San Simon', 'Santa Maria', 'Santa Rosa', 'San Teresita', 'Santo Tomas', 'Silang', 'Sta Cruz Laguna', 'Sultan Kudarat (Nuling)', 'Taal', 'Tacoloban City', 'Tagaytay City', 'Tabilaran City', 'Taguig City', 'Talisay City', 'Tanauan', 'Tanay', 'Tanza', 'Tarlac City', 'Taytay', 'Teresa', 'Trece Martires City', 'Tuguegarao City', 'Urdaneta City', 'Valenzuela City', 'Victoria', 'Villasis' , 'Zamboanga City'] }
	validates :province, presence: true, acceptance: { accept: ['Abra', 'Agusan del Norte', 'Agusan del Sur', 'Aklan', 'Albay', 'Antique', 'Apayao', 'Aurora', 'Basilan', 'Bataan', 'Batanes', 'Batangas', 'Benguet', 'Biliran', 'Bohol', 'Bukidnon', 'Bulacan', 'Cagayan', 'Camarines Norte', 'Camarines Sur', 'Camiguin', 'Capiz', 'Catanduanes', 'Cavite', 'Cebu', 'Compostela Valley', 'Cotabato', 'Davao del Norte', 'Davao del Sur', 'Davao Occidental', 'Davao Oriental', 'Dinagat Islands', 'Eastern Samar', 'Guimaras', 'Ifugao', 'Ilocos Norte', 'Ilocos Sur', 'Iloilo', 'Isabela', 'Kalinga', 'La Union', 'Laguna', 'Lanao del Norte', 'Lanao del Sur', 'Leyte', 'Maguindanao', 'Marinduque', 'Masbate', 'Misamis Occidental', 'Mountain Province', 'Negros Occidental', 'Negros Oriental', 'Northern Samar', 'Nueva Ecija', 'Nueva Vizcaya', 'Occidental Mindoro', 'Oriental Mindoro', 'Palawan', 'Pampanga', 'Pangasinan', 'Quezon', 'Quirino', 'Rizal', 'Romblon', 'Samar', 'Sarangani', 'Siquijor', 'Sorsogon', 'South Cotabato', 'Southern Leyte', 'Sultan Kudarat', 'Sulu', 'Surigao del Norte', 'Surigao del Sur', 'Tarlac', 'Tawi-Tawi', 'Zambales', 'Zamboanga del Norte', 'Zamboanga del Sur', 'Zamboanga Sibugay', 'Metro Manila'] }
	validates :zip, presence: true, length: { maximum: 4 }, numericality: { only_integer: true }
	validates :contact_number, presence: true, length: { maximum: 15 }, numericality: {only_integer: true}
	validates :shipping_fee, presence: true, length: { maximum: 8 }, numericality: { greater_than: 0 }
	validates :payment_method, presence: true, acceptance: { accept: ['Paypal', 'Cash on Delivery', 'Bank Deposit'] }
	validates :total_amount, presence: true, length: { maximum: 8 }, numericality: { greater_than: 0 }
	validates :order_status, presence: true, acceptance: { accept: ['Pending', 'Processed', 'Shipped', 'Delivered']}
	private
		def randomize_id
			begin
				self.id = SecureRandom.random_number(999999)
			end while Order.where(id: self.id).exists?
		end
end