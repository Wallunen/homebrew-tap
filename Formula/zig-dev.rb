class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "86f4bcda186d4bdeddd1674cd12435df701fb4977552ba907efeb2375fff9460" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2885630dafb6a03b1998dba105bab1488a84286cd8806d940a8316d1c526b28e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c69183bb8988f19add1cbcb0f08b9c651f475825bfe56d6381dfc045d989ba15" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2892+fd6200eda.tar.xz"
  version "0.11.0-dev.2892+fd6200eda"
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
