import React from 'react'
import { Link } from 'react-router-dom'
import { FaExclamationTriangle } from 'react-icons/fa'

const NotFoundPage = () => {
  return (
    <section className="bg-gray-50 min-h-screen flex items-center justify-center py-12 px-4">
      <div className="max-w-2xl w-full">
        <div className="bg-white border-4 border-black rounded-lg shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] p-8 text-center">
          {/* Warning Icon */}
          <div className="flex justify-center mb-6">
            <div className="bg-yellow-400 border-4 border-black rounded-lg shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] p-6">
              <FaExclamationTriangle className="text-black text-6xl" />
            </div>
          </div>
          
          {/* Error Message */}
          <h1 className="text-5xl sm:text-7xl font-black uppercase mb-4 text-black">
            404
          </h1>
          <h2 className="text-2xl sm:text-3xl font-black uppercase mb-4 text-black">
            Page Not Found
          </h2>
          <p className="text-lg font-bold text-gray-700 mb-8">
            Oops! The page you're looking for doesn't exist.
          </p>
          
          {/* Go Back Button */}
          <Link
            to="/"
            className="inline-block bg-blue-400 text-black font-black uppercase px-8 py-4 border-4 border-black rounded shadow-[6px_6px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-1.5 hover:translate-y-1.5 transition-all"
          >
            Go Back Home
          </Link>
        </div>
      </div>
    </section>
  )
}

export default NotFoundPage