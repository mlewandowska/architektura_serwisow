# -*- coding: utf-8 -*-

class Fortune < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  attr_accessible :quotation, :source

  validates :quotation, presence: true
  validates :quotation, length: { maximum: 256 }
  validates :quotation, uniqueness: { case_sensitive: false }

  validates :source, length: { in: 3..64 }, allow_blank: true

  acts_as_taggable_on :tags
  ActsAsTaggableOn::TagList.delimiter = " "

  # def self.text_search(query)
  #   if query.present?
  #     # SQLite i PostgreSQL
  #     where('quotation like :q or source like :q', q: "%#{query}%").order('created_at DESC')
  #     # tylko PostgreSQL, i – ignore case
  #     # where("quotation ilike :q or source ilike :q", q: "%#{query}%").order('created_at DESC')
  #   else
  #     scoped
  #   end
  # end

  # def self.text_search(query)
  #   if query.present?
  #     where("quotation @@ :q or source @@ :q", q: query).order('created_at DESC')
  #   else
  #     scoped
  #   end
  # end

  # def self.text_search(query)
  #   if query.present?
  #     # where("quotation @@ :q or source @@ :q", q: query)
  #     orquery = <<-ORQUERY
  #     to_tsvector('english', quotation) @@ plainto_tsquery('english', #{sanitize(query)})
  #       or
  #     to_tsvector('english', source) @@ plainto_tsquery('english', #{sanitize(query)})
  #   ORQUERY
  #     where(orquery)
  #   else
  #     scoped
  #   end
  # end


  # Texticle

  # def self.text_search(query)
  #   if query.present?
  #     search(query)    # metoda zdefiniowana w Texticle
  #   else
  #     scoped
  #   end
  # end


  # PgSearch, default: rank DESC

  include PgSearch

  # definiujemy metodę `search`
  pg_search_scope :fortunes_search,
      against: [:quotation, :source],
      using: {tsearch: {dictionary: "english"}}

  def self.text_search(query)
    if query.present?
      fortunes_search(query)    # metoda zdefiniowana powyżej
    else
      scoped
    end
  end

end
