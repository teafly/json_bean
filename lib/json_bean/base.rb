module JsonBean

  VERSION = "0.0.1"
end

Array.class_eval do

  def to_json_bean(options = {})

    res = []
    self.each do |data|

      res.push data.to_json_bean(options) if data.method_defined? :to_json_bean
    end

    return Json.generate(res)
  end
end