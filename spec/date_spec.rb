describe Date do

  describe ".create" do
    it "adds a date to the date table" do
      date = Date.create(date: '2020-01-01')
      persisted_data = DatabaseConnection.query("SELECT * FROM dates WHERE id = #{date.id};")
      expect(date).to be_a(Date)
      expect(date.date).to eq(persisted_data[0]['date'])
      expect(date.id).to eq(persisted_data[0]['id'])
    end
  end
#  describe ".available_dates" do
#    it "creates array of spaces available dates" do
#      user = User.create(email: 'user@user.com', name: 'Ilja', password: '123456')
#      space = Space.create(name: 'another space', description: 'another nice place to stay', price: 1, userid: user.id, start_date: '2020-01-01', end_date: '2020-01-10')
#      expect(DatabaseConnection).to receive(:query).with("select t.dt::date from spaces p, generate_series(p.start_date, p.end_date, interval '1' day) as t(dt) order by t.dt::date;")
#      result = Date.available_dates("select t.dt::date from spaces p, generate_series(p.start_date, p.end_date, interval '1' day) as t(dt) order by t.dt::date;")
#      p result
#      expect(result).to eq([])
#    end
#  end
end
