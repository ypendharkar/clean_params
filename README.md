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

Example initializer file -

	CleanParams.configure do |config|
	  config.params = {
	    # Customize your params here
	    'key' => [['key', 'Key'], 'default'],
		'key2' => [['key2', 'Key2'], 'key2']
	  }
	end
	
Example params hash -

	params = {"utf8"=>"✓", "authenticity_token"=>"123", "Key" => "key", "token"=>"323344", "customer_detail"=>{"caller_id"=>"123", "customer_name"=>"XYZ"}}
	
And goodies -

	params = CleanParams.clean(params) # params - rails params hash
	params.key # => key
	params.key2 # => key2
	params.token # => 323344
	params.caller_id # => 123
	
Or you can include it inside the filter in ApplicationController and use the object inside any controller.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
