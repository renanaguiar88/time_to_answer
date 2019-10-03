# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# /app/assets
Rails.application.config.assets.precompile += %w(admins_backoffice.scss admins_backoffice.coffee users_backoffice.scss users_backoffice.coffee 
  admin_devise.scss admin_devise.coffee user_devise.scss user_devise.coffee site.scss site.coffee)

# /lib/assets
Rails.application.config.assets.precompile += %w(sb-admin-2.js sb-admin-2.css bootstrap.bundle.js bootstrap.bundle.js.map custom.js custom.css img.jpg
  surface-fix.css surface-fix.js navbar.css all.css)

# /vendor/assets
Rails.application.config.assets.precompile += %w(jquery-2.2.3/dist/jquery.js jquery/dist/jquery)