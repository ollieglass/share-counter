require 'rest-client'

#
#
# Performs an HTTP request to the given API URL with the specified params
# and within 2 seconds, and max 3 attempts
#
# If a :callback param is also specified, then it is assumed that the API
# returns a JSON text wrapped in a call to a method by that callback name,
# therefore in this case it manipulates the response to extract only
# the JSON data required.
#
def make_request *args
  result   = nil
  attempts = 1
  url      = args.shift
  params   = args.inject({}) { |r, c| r.merge! c }

  begin
    response    = RestClient.get url,  { :params => params, :timeout => 5 }

    # if a callback is specified, the expected response is in the format "callback_name(JSON data)";
    # with the response ending with ";" and, in some cases, "\n"
    #Strip off the preceeding /**/
    result = params.keys.include?(:callback) \
      ? response.gsub(/\A\/\*\*\/\s+/, "").gsub(/^(.*);+\n*$/, "\\1").gsub(/^#{params[:callback]}\((.*)\)$/, "\\1") \
      : response

  rescue Exception => e
    puts "Failed #{attempts} attempt(s) - #{e}"
    attempts += 1
    if attempts <= 3
      retry
    else
      raise Exception
    end
  end

  result
end

