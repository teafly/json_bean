module JsonBean

  VERSION = "0.0.1"
end

Array.class_eval do

  def to_json_bean(options = {})

    res = []
    self.each do |data|

      res.push data.as_json_bean(options) if data.class.method_defined? :as_json_bean
    end

    return JSON.generate(res)
  end
end