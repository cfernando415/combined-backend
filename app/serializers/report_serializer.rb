class ReportSerializer < ActiveModel::Serializer
  attributes :id, :date, :population, :gender, :hired
end
