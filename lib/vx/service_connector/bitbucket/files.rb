require 'base64'

module Vx
  module ServiceConnector
    class Bitbucket
      Files = Struct.new(:session, :repo) do

        def get(sha, path)
          begin
            session.get("#{BITBUCKET_API_1}/repositories/#{repo.full_name}/src/#{sha}/#{path}")
          rescue RequestError => e
            $stderr.puts "ERROR: #{e.inspect}"
            nil
          end
        end

      end
    end
  end
end