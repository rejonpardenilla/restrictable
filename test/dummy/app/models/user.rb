class User < ApplicationRecord
  enum role: [
    :admin,
    :normal,
    :guest
  ]
end
