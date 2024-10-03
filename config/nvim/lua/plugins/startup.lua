return {
	-- Lazy load the 'startup.nvim' plugin
	{
		"startup-nvim/startup.nvim",
		config = function()
			local neovim = {
			"⣿⣿⣿⣿⣿⣿⣿⣿⡿⡫⣁⡴⣈⡼⣟⣭⣷⣿⡿⠿⡽⡟⠍⡙⢕⣢⣿⡟⣱⣿⣿⣿⣿⣿⠟⠋⡕⢼⣣⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⢿⣩⣾⣿⡿⣿⣿⢿⣿⣿⣿⣿⡿⠛⣙⢄⣽⣿⣿⣿⡃⢹⣿⣿⣾⢫⢿⢇⣿⡟⣼⣿⡇⠯⠈⠰⣶⣾⣶⡄⢻⣿⣿⢎⣮⡹⠗⣠⣵⣶⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⡿⡫⣪⡾⣫⣾⣯⠾⠛⣋⣥⣶⡿⠟⣩⢔⣼⣾⣿⣿⠏⣼⣿⣿⢟⣿⡟⣡⢊⣼⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⡿⣫⣷⣿⣿⣿⣫⢏⡼⣫⣾⣿⣿⣿⣃⢔⠟⣱⣿⣿⡿⣛⣿⣿⣿⣿⣿⣿⣏⡾⣼⡿⣸⣿⣿⠃⣴⠠⢹⣸⡿⣿⣇⡱⡊⣿⣎⣎⢷⡘⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⠟⢞⣾⡟⠾⠿⢋⢥⣺⣯⣷⡿⢋⣴⣯⣾⡿⢟⢛⣻⠏⣼⣿⣿⠏⣾⣿⠟⣵⣿⣿⣿⣿⡿⠿⠟⠛⣛⣉⣥⣴⣶⡿⢟⣿⣿⣿⣿⡟⠑⣡⠯⣺⣿⣿⣿⣿⡿⢋⣴⣾⠿⠟⣫⣾⣿⣿⡟⣼⣿⣿⣿⡙⣽⡟⣵⣿⣿⣥⣦⡏⡇⠈⡏⣷⡹⣿⣦⠑⡜⣿⣯⢫⢭⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⡟⣠⠟⣩⣴⡾⣥⣼⠿⣫⣥⢈⣶⠶⢛⢍⡒⣡⡶⣼⠏⣰⣿⣿⢋⠶⢿⢥⣾⣮⣭⣿⢤⣤⡶⡾⣻⣿⠟⣨⣿⡿⢋⣴⣿⡿⣛⡟⡁⣴⡞⣡⣾⣿⢟⣭⣿⡿⠱⠟⡡⡊⣠⣾⣿⡿⣫⣟⣼⣿⢫⢯⣿⢸⣿⣾⣿⣿⣿⣿⢼⣷⣿⠀⣷⢿⢸⣜⢿⣷⡘⣞⢿⣷⡵⡣⠘⢿⣿⣿⣿⣿⣿⣿⣿⠿⢟⡛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⡇⡉⣼⣿⡿⣼⡟⢡⣾⡿⢃⢈⡴⠚⠑⣋⣾⢟⠊⡄⢠⣿⡿⢃⡴⡵⣳⣿⢟⣵⡿⣵⡿⠿⠹⣼⣿⠏⣼⡿⢋⣴⣿⡿⣫⣪⢞⣡⠟⣢⣾⣿⠟⣵⡿⠛⣩⠞⣡⠪⢞⣾⣿⠟⢡⢞⠉⢊⣿⠇⡜⣸⡇⢠⣿⣿⣿⢿⣿⡟⣾⢹⣿⢈⣿⢸⠰⢻⡄⣻⣿⣎⢈⠻⣿⣞⢆⢸⣿⡿⢿⣻⣭⣷⣾⣿⣿⣿⣿⣶⣬⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣷⣦⣿⣿⢱⡟⣴⣿⠟⢑⣫⣷⠖⣡⣾⡿⡵⢁⡞⢻⣾⡟⢁⣞⣞⡽⣟⣵⡿⣫⠿⢋⡴⢰⣱⣿⠇⣼⠏⣠⣾⣿⢯⣾⢞⢵⣫⣷⢾⡯⠫⢠⡞⣡⢮⠞⣱⠞⣡⣢⣿⡿⠑⡠⣵⢇⣆⣾⡏⣼⠃⣿⠀⣽⡏⣿⡏⣼⣿⢳⡏⢨⡏⢘⣿⡔⢈⣸⣿⠱⡹⣿⢸⣰⡌⢛⣣⣬⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣬⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣮⠀⠩⢁⣴⣿⢟⣵⣾⡟⠩⠊⢒⢽⣾⣧⣻⡌⣾⢉⣬⠞⠏⠩⢚⣡⣾⠿⡃⡎⣿⠏⡼⢃⣼⣿⡟⢕⠕⣡⣴⢿⡫⠟⣙⣤⣶⠟⢌⡵⢋⡜⣡⡾⣵⣿⠟⢀⣤⡾⣱⡟⢌⡞⣰⡇⣠⡟⡠⣿⡇⣿⡇⣾⣿⡾⢀⣾⡟⣸⣿⣧⢸⣧⣿⢹⠁⣟⣬⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣙⢿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⢿⣢⣤⣿⢟⡵⠟⣁⣨⢁⣾⡌⣿⠂⢻⣿⡧⣁⠵⣋⡴⢊⡔⠈⠼⡿⣫⣾⠀⣹⣿⣿⢡⡾⣿⣋⣤⣧⠿⠫⢓⡩⣴⣾⡿⣫⠉⢠⣞⡷⢪⣤⣟⣽⣿⠏⣴⣿⢏⣾⡿⠘⡞⢱⡿⣠⣿⠇⡆⣿⡇⣿⢇⣿⣿⠁⣾⣿⢳⣿⠿⢇⣦⠻⣉⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣙⢿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⠏⠕⣩⣴⣿⡿⣣⡿⡳⣣⢹⠀⣃⠅⡨⠠⠞⢱⡞⣼⠛⣆⣧⣝⢛⡻⠤⢯⣟⣃⣲⣯⣿⠿⢛⢡⣶⣾⠛⣴⡿⣫⣾⠃⣰⣯⡟⣱⣯⣏⣼⣿⢃⣾⣿⢣⣿⢏⠄⡼⢡⣿⠇⣼⡿⢠⡏⣿⡇⣿⠈⣿⠇⣾⣿⢧⣿⠃⢀⣾⡟⡰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡙⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡱⠇⣼⣿⣿⢟⡼⠋⣠⠞⠋⠀⠈⣤⣤⢷⢸⡟⣨⡇⠁⣇⢸⣿⣿⣷⣮⢁⠔⡭⠋⠉⡠⣊⡞⣳⣿⣿⣫⣼⢟⣾⣿⠁⡴⣳⢏⣾⣿⣟⡾⢻⣯⣿⣿⡡⢭⢏⡟⢰⢁⡟⡘⢰⣿⡅⣐⡚⣿⡇⣿⢂⡟⣼⣿⢏⣸⠇⣨⣼⡟⡌⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣈⢻⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠗⠝⡫⠞⣩⡔⣂⣮⢠⣶⡇⡐⡰⣶⠊⢸⠇⣿⡧⡗⣼⢾⣬⣭⡝⡡⡣⠚⠔⠀⢘⣼⣿⢳⣿⣿⣷⣿⣵⣿⣿⠃⣼⣵⢯⣿⣿⡟⣜⢡⡟⢹⣿⢱⣿⣿⣾⠃⢢⡟⣠⢇⣿⣿⡇⡯⠇⣽⡇⣿⢸⡽⣻⢟⠘⠈⣰⣿⡟⢸⢷⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⢹⣿⡏⢹⣿⡟⠁⠈⣿⡿⠁⣿⣿⠁⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢹",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⣀⣥⣴⣾⣳⣾⢟⣵⢯⠞⡠⢳⢷⡭⢰⡏⡇⡏⡇⡅⢻⣿⡿⢋⠈⡀⣰⡷⠀⣠⣈⡹⢛⡿⠿⣿⣿⣿⣿⣿⡿⠰⣳⢫⣿⣿⣿⠹⣁⡾⢡⢸⢣⣿⣿⣿⠿⠐⢋⠚⡈⣬⣭⣴⣶⣞⡇⣿⡇⣿⣸⣱⠟⣎⡇⣸⣿⡟⣼⡟⡾⢸⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠈⡿⢀⡾⠋⣠⠆⠀⣿⠁⠈⠉⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣫⣴⠿⠕⣡⢮⡾⡘⣦⣿⡸⡇⠀⡅⢡⢥⢐⡋⢦⣶⡿⢯⣽⢧⢡⣿⣺⣟⣶⣾⣥⣜⣢⠫⣉⠿⣿⣾⢏⣿⣿⣿⣿⢰⠻⢣⣿⢈⡬⠝⣀⣲⣤⣴⣟⢞⣽⣿⣿⣿⡿⣿⡿⢸⡗⣿⠉⢣⡇⣿⢠⣿⣿⡹⠟⣼⢷⢸⣿⣿⣿⣿⣿⣿⣿⡿⠀⣶⠀⠀⡼⠁⣀⣠⡄⠠⠇⢠⣾⡟⢀⣾⡿⠋⣹⣿⣿⣿⣿⣿⣿⣿⡟⢸",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣋⣡⣘⣣⣴⡾⣽⣳⢏⡼⠁⠙⣿⡇⢿⠀⠻⡾⣸⣿⣿⡐⠢⠩⠀⠐⠀⠭⢒⣚⠯⢭⣛⡿⣿⣿⣷⣶⢤⡹⡟⣼⣿⣿⣿⣿⣮⣴⡿⠿⣄⣶⣾⣿⣿⡿⢟⣫⠭⠿⠒⠢⠤⠔⠀⠀⠘⣧⣿⠌⣿⠃⡟⣼⣿⣿⣇⠆⡿⣼⢸⣿⣿⣿⣿⣿⣿⣿⣧⣼⣿⣧⣼⣧⣼⣿⣿⣦⣴⣤⣿⣿⣦⣼⡟⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⡇⣼",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⡿⣽⠃⢡⣾⠁⢞⣧⢹⡇⢸⡇⢧⢷⡉⣿⣿⣿⡃⠜⣿⣿⡇⢻⣷⡂⢸⣤⣈⠙⠂⣿⣿⣿⣧⢠⢸⣿⣿⣿⣿⣿⣿⡟⠁⣹⣿⣿⣿⣿⡿⠐⢋⠁⣤⣖⣘⣻⠇⣼⣿⣿⠃⣹⡏⠸⢃⡏⠀⣻⣿⣿⣟⡀⣇⡏⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠛⢿⠛⢻⡿⠟⠛⠛⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠗⢋⣴⣿⡏⠀⣾⡿⠀⠇⣾⡉⣘⣿⣧⡸⣿⣿⣧⡡⢻⣿⣿⣦⣘⠿⢽⣛⣽⣷⡀⠸⣿⣿⣿⣃⡀⣿⣿⣿⣿⣿⣿⡟⣧⣹⣿⣿⣿⣿⠃⢰⣿⣷⣝⡻⢛⣋⣴⣿⣿⢏⣇⢻⡌⠈⡸⢽⠐⣿⣿⡟⣼⣱⡿⣠⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡄⢠⣶⠀⣴⣿⠀⣠⣶⣶⠂⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⠀⢰⣿⠃⡜⠀⢻⡇⢸⣿⣿⣷⣽⣿⣿⣿⣣⡻⢿⣿⣿⣿⣿⣿⣿⡿⢠⣐⢉⢉⡿⢉⣴⣿⣿⣿⣿⣿⣿⣿⣾⣿⡿⠻⢿⡏⢠⣌⢿⣿⣿⣿⣿⣿⣿⡿⣫⣜⣿⢳⢠⢹⡇⣸⣷⣾⢛⡇⢿⡟⣱⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣾⣿⣿⣿⡏⢠⠿⠛⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢠⡜⣣⣾⢁⣃⢹⣿⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣾⣿⣥⣴⣿⣳⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⠡⠛⢿⣾⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⠈⡇⢾⣷⣿⣿⡿⢸⣿⡞⡀⣾⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠉⢁⣀⣠⣽⣿⣿⣀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣵⣾⣿⢇⢈⡜⣅⠹⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣸⣧⢻⣿⣿⣿⡇⣿⡟⡀⡆⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢊⣬⣾⣿⣷⣤⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣾⣿⣿⣾⣿⣿⡿⠸⠟⠠⢠⢣⢿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢹⡟⠈⢹⣿⠃⣸⠏⢸⡏⠈⣿⡿⠁⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⡆⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣴⠀⡏⣸⡇⠎⢿⡛⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⡟⢁⠀⠸⠃⣰⡟⢀⡿⠀⡀⠘⠃⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣽",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣸⣿⠀⠀⣿⣿⢰⣾⡇⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢠⣾⡀⠀⣴⡿⠁⣾⠁⣼⣷⠀⢠⣿⠛⢙⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢠⣿⡏⠠⣸⣿⣷⣿⣿⢃⣨⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿⣷⣾⣿⣷⣼⣿⣶⣿⣿⣷⣾⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⡿⣡⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⣾⣿⢁⣵⣿⣿⣿⣿⣿⣆⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣱⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣬⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣴⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⡙⢿⣿⡿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣽⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣼⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢂⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣯⣝⡻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠋⢁⣾⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢱⡌⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⣾⠃⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣬⡁⣨⠿⣛⣛⣛⣻⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠐⠌⣿⣆⠹⣿⣿⣿⣿⣿⣏⣙⣻⠿⠿⢿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣟⣋⣤⣾⣿⣿⣿⡿⢣⣾⣿⢏⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡴⣩⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⡳⢹⣿⣷⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣗⢦⡀⠀⠤⣤⣤⣤⣤⣤⣤⣄⠤⠖⡀⢴⣶⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣿⡿⠋⣀⠀⣺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣨⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢰⣌⠊⣿⣿⣿⣆⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣙⠛⠛⠒⠒⠒⠒⠒⡖⢒⣩⣼⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣿⣿⣿⠍⣐⡇⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣷⣿⣿⣿⣿⣷⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⣴⣿⣿⣿⣿⡏⢀⡳⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣖⢀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣿⣿⣿⣿⣿⣿⡯⢅⡾⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠃⠘⣿⡷⣝⢿⣿⣿⣿⣿⡧⠢⡀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⣰⣿⣿⣿⣿⣿⣿⣭⣾⣿⡇⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⣿⣿⣮⡳⡍⠿⣿⣿⣿⣌⠺⢔⣌⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⢂⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⡌⠲⣜⢿⣿⣿⣿⡄⢠⣹⣷⣆⣉⠛⠿⠿⠿⠿⢿⠿⡿⠿⠿⠟⠋⣀⠤⡢⢼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣷⡐⢔⢌⢿⣿⣿⣿⣄⠐⢿⣿⣿⣿⣿⣷⣶⣶⣦⣦⣴⣤⣦⡔⠲⢌⡱⣴⣿⣿⣿⠟⢋⣩⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣷⢠⠓⢮⣻⣿⣿⣿⣎⢈⠽⣛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠣⠕⢲⣿⣿⣿⣿⢏⣰⣾⠿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣇⢙⢴⢙⣿⣿⣿⣿⣷⡱⣦⣪⠬⣽⣛⡿⡟⣻⣿⣿⣣⣌⣴⣿⣿⣿⡿⢁⡴⢚⣋⠸⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⡿⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⢝⢆⢻⣿⣿⣿⣿⣧⢩⣫⠭⢟⣻⢒⣼⣿⣿⣯⢅⣾⣿⣿⡿⢋⡀⢦⣼⠯⣭⣶⣾⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⠿⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠘⠿⢿⣿⣿⣿⣄⣺⢭⣻⡆⢾⣿⣿⣿⡄⣿⣿⣿⡟⠁⠀⢴⡟⣮⡿⠼⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			}

			local quotes = {
				{ "Stay hydrated" },
				{ "Every sunrise is a chance to paint a new masterpiece." },
				{ "You are the lighthouse in someone else's storm." },
				{ "Courage isn't loud. Sometimes, it's the quiet voice that says, 'I'll try again tomorrow.'" },
				{ "The stars are only visible in the dark, just like your strengths in tough times." },
				{ "Celebrate small wins—they build up to big victories." },
				{ "Let your kindness be your strongest voice." },
				{ "In a world full of trends, remain timeless." },
				{ "You’re a story still being written, and it's one worth reading." },
			}

			require("startup").setup({
				header = {
					type = "text",
					oldfiles_directory = false,
					align = "center",
					fold_section = false,
					title = "Header",
					margin = 5,
					content = neovim,
					highlight = "Text",
					default_color = "",
					oldfiles_amount = 0,
				},
				body = {
					type = "mapping",
					oldfiles_directory = false,
					align = "center",
					fold_section = false,
					title = "Basic Commands",
					margin = 5,
					content = {
						{ " Find file", "Telescope find_files", "f" },
						{ " Open tree", "NvimTreeOpen", "t" },
						{ " Settings", "cd ~/.config/nvim | NvimTreeOpen", "c" },
						{ " Quit nvim", "qa", "q" },
					},
					highlight = "String",
					default_color = "",
					oldfiles_amount = 0,
				},
				footer = {
					type = "text",
					oldfiles_directory = false,
					align = "center",
					fold_section = false,
					title = "Footer",
					margin = 5,
					content = quotes[math.random(#quotes)],
					highlight = "Number",
					default_color = "",
					oldfiles_amount = 0,
				},
				options = {
					mapping_keys = true,
					cursor_column = 0.5,
					empty_lines_between_mappings = true,
					disable_statuslines = true,
					paddings = { 4, 2, 1, 2 },
				},
				mappings = {
					execute_command = "<CR>",
				},
				parts = { "header", "body", "footer" },
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}