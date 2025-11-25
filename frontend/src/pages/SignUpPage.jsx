import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const SignUpPage = () => {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [rePassword, setRePassword] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    if (password !== rePassword) {
      setError("Passwords do not match.");
      return;
    }
    try {
      const res = await fetch('/api/auth/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ firstName, lastName, email, password })
      });
      if (!res.ok) {
        const data = await res.json();
        setError(data.message || 'Signup failed.');
        return;
      }
      navigate('/login');
    } catch {
      setError('Network error. Please try again.');
    }
  };

  return (
    <section className="bg-indigo-50">
      <div className="container m-auto max-w-2xl py-24">
        <div className="bg-white px-6 py-8 mb-4 shadow-md rounded-md border-3 m-4 md:m-0">
          <form onSubmit={handleSubmit}>
            <h2 className="text-3xl text-center font-semibold mb-6">Sign Up</h2>
            <div className="mb-4">
              <label className="block text-gray-700 font-bold mb-2">First Name</label>
              <input
                type="text"
                id="firstName"
                name="firstName"
                className="border rounded w-full py-2 px-3 mb-2"
                placeholder="eg. John"
                value={firstName}
                onChange={e => setFirstName(e.target.value)}
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700 font-bold mb-2">Last Name</label>
              <input
                type="text"
                id="lastName"
                name="lastName"
                className="border rounded w-full py-2 px-3 mb-2"
                placeholder="eg. Smith"
                value={lastName}
                onChange={e => setLastName(e.target.value)}
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700 font-bold mb-2">Email</label>
              <input
                type="email"
                id="email"
                name="email"
                className="border rounded w-full py-2 px-3 mb-2"
                placeholder="eg. name@domain.com"
                value={email}
                onChange={e => setEmail(e.target.value)}
                required
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700 font-bold mb-2">Password</label>
              <input
                type="password"
                id="password"
                name="password"
                className="border rounded w-full py-2 px-3 mb-2"
                placeholder="Enter your password"
                value={password}
                onChange={e => setPassword(e.target.value)}
                required
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700 font-bold mb-2">Re-Enter Your Password</label>
              <input
                type="password"
                id="re-enter-password"
                name="re-enter-password"
                className="border rounded w-full py-2 px-3 mb-2"
                placeholder="Enter your password"
                value={rePassword}
                onChange={e => setRePassword(e.target.value)}
                required
              />
            </div>
            {error && (
              <div className="mb-4 text-red-600 font-bold text-center">{error}</div>
            )}
            <div>
              <button
                className="bg-indigo-900 hover:bg-indigo-600 text-white font-bold py-2 px-4 rounded-lg w-full focus:outline-none focus:shadow-outline"
                type="submit"
              >
                Save
              </button>
            </div>
          </form>
        </div>
      </div>
    </section>
  );
};

export default SignUpPage;
