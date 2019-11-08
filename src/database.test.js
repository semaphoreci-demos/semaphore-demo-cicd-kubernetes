const db = require('./database');
beforeAll(async () => {
    await db.sequelize.sync();
});
test('create person', async () => {
    expect.assertions(1);
    const person = await db.Person.create({
        id: 1,
        firstName: 'Sammy',
        lastName: 'Davis Jr.',
        email: 'sammy@example.com'
    });
    expect(person.id).toEqual(1);
});
test('get person', async () => {
    expect.assertions(2);
    const person = await db.Person.findByPk(1);
    expect(person.firstName).toEqual('Sammy');
    expect(person.lastName).toEqual('Davis Jr.');
});
test('delete person', async () => {
    expect.assertions(1);
    await db.Person.destroy({
        where: {
            id: 1
        }
    });
    const person = await db.Person.findByPk(1);
    expect(person).toBeNull();
});
afterAll(async () => {
    await db.sequelize.close();
});
