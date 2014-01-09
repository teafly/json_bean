require "json"
require_relative "base"

module JsonBean::Mongoid

  def as_json_bean(options = {})

    res = {}
    JSON.parse(self.as_document.to_json).each do |key, val|

      #是否可被序列化
      next if !(colums = options[:only]).nil? && !colums.empty? && colums.include?(key.to_sym)

      #是否有别名
      _alias = (_alias = self.class.class_variable_get(:@@bean_alias)).empty? ? options[:alias] : _alias
      key = _alias.nil? || (_ob = _alias[key.to_sym]).nil? ?  key : _ob

      res[key] = val 
    end

    return res
  end

  def to_json_bean(options = {})

    return JSON.generate(as_json_bean(options))
  end

  def self.included(base)

      base.extend ClassMethods
      base.class_variable_set(:@@bean_alias, {})
  end

  private
  module ClassMethods

    def bean_alias(_alias = {})

      self.class_variable_set(:@@bean_alias, _alias)
    end
  end
end