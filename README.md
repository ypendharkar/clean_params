# CleanParams

Clean Params is a Ruby gem for use with Rails to access the controller parameters cleanly.
No more ugly hash accesses. No more flooding your codebase with multiple condition checking.
With clean_params you can specify various rules to parse your params hash inside the initializer file.
It also allows for nested hash parsing.

## Installation

Add this line to your application's Gemfile:

    gem 'clean_params'

Run the generator to create the initializer file. You can specify your parsing rules here.

    rails g clean_params:install

## Usage

	params = CleanParams.clean(params) # params - rails params hash
	params.key # => params[:key]
	params.token # => params[:token]
	
Or you can include it inside the filter in ApplicationController and use the object inside any controller.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
