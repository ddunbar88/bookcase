class Book < ApplicationRecord
  before_save :downcase_content

  def self.search(search)
    if search
      search = search.downcase
      where("title LIKE ? OR author LIKE ? OR genre LIKE ? OR classification LIKE ? OR booktype LIKE ?","%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def self.classifications
    [
    "General Works - encyclopedias",
    "Philosophy, Psychology, Religion",
    "History - Auxiliary Sciences",
    "History (except American)",
    "General U.S. History",
    "Local U.S. History",
    "Geography, Anthropology, Recreation",
    "Social Sciences U",
    "Political Science V",
    "Law Z - Bibliography and Library Science",
    "Education",
    "Music",
    "Fine Arts",
    "Language and Literature",
    "Science",
    "Medicine",
    "Agriculture",
    "Technology",
    "Military",
    "Naval Science",
    "Bibliography and Library Science"
    ].each_with_index.map { | classification, index | [ classification, index ] }
  end

  def self.booktypes
  [
  "Fiction",
  "Nonfiction"
  ].each_with_index.map { | booktype, index | [ booktype, index ] }
  end

  private 

  def downcase_content
    self.title = self.title.downcase
    self.author = self.author.downcase
    self.genre = self.genre.downcase
    self.classification = self.classification.downcase
    self.booktype = self.booktype.downcase
  end
end
