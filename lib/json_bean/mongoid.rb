require "json"
require_relative "base"

module JsonBean::Mongoid

  def to_json_bean(options = {})


    res = {}
    JSON.parse(self.as_document.to_json).each do |key, val|

      #是否可被序列化
      next if !(colums = options[:only]).nil? && !colums.empty? && colums.include?(key.to_sym)
      
      #是否有别名
      _alias = (_alias = self.class.class_variable_get(:@@bean_alias)).empty? ? options[:alias] : _alias
      key = _key unless _alias.nil? || (_key = _alias[key.to_sym]).nil?

      res[key] = val 
    end

    return Json.generate(res)
  end

  def self.included(base)

      base.extend ClassMethods
      base.class_variable_set(:@@default_s11n_alias, {})
  end

  private
  module ClassMethods

    def bean_alias(_alias = {})

      self.class.class_variable_set(:@@bean_alias, _alias) unless _alias.nil? || _alias.empty?
    end
  end
end