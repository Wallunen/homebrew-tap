class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260608-182143"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4c1f6efe2eaf8765254b8ca2204c0dfc6f5d3ff675928bfacc935d46a55f8b54"
    sha256 cellar: :any_skip_relocation, sequoia:      "3eed9a938c1e378da1aa91220a0f695a3ee2c204cf4483f6355380fa4d13a1f1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8bf5aa7cd4af7557269b648fd945faed830d424c9ef979ec5247412e9ca38004"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c52552e04b7f10ff5499db8962903949538ac5bd65cab36a47f8568e7324b211" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "59c2fbde9ad536c46a675a453b6fd7094a618f29c3ccf38c7eb9411817582a1a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3c6066b51dbf8870fd972042cdfd53d9f85f17f6619d0e60a152c6df0a5149ab" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.836+e357134f0.tar.xz"
  version "0.17.0-dev.836+e357134f0"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
