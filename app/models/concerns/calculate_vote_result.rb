class CalculateVoteResult

  def initialize(game_id)
    @game_users = GameUser.includes(:user).where(game_id: game_id)
    @sum = sum
  end

  def sum
    hash = {}

    @game_users.each do |gu|
      hash[gu.score] = {users: [], score: 0} if hash[gu.score].nil?
      hash[gu.score][:score] += 1
      hash[gu.score][:users] << gu.user.to_s
    end

    sort = hash.sort_by{|k, v| v[:score]}
    sort.reverse
  end

  def get
    @sum
  end
end
